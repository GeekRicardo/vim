// Copyright (C) 2018 ycmd contributors
//
// This file is part of ycmd.
//
// ycmd is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// ycmd is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with ycmd.  If not, see <http://www.gnu.org/licenses/>.

#include "Character.h"
#include "Repository.h"
#include "TestUtils.h"
#include "Word.h"

#include <array>
#include <gtest/gtest.h>
#include <gmock/gmock.h>

using ::testing::TestWithParam;
using ::testing::ValuesIn;

namespace YouCompleteMe {

class WordTest : public TestWithParam< WordTuple > {
protected:
  WordTest()
    : repo_( Repository< Character >::Instance() ) {
  }

  virtual void SetUp() {
    repo_.ClearElements();
    word_ = WordTuple( GetParam() );
  }

  Repository< Character > &repo_;
  WordTuple word_;
};


std::ostream& operator<<( std::ostream& os,
                          const CharacterSequence &characters ) {
  os << PrintToString( characters );
  return os;
}


TEST_P( WordTest, BreakIntoCharacters ) {
  std::vector< std::string > characters;
  for ( const auto &character : word_.characters_ ) {
    characters.push_back( NormalizeInput( character ) );
  }
  EXPECT_THAT( Word( word_.text_ ).Characters(),
               ContainsPointees( repo_.GetElements(
                                 std::move( characters ) ) ) );
}


// Tests generated from
// https://www.unicode.org/Public/UCD/latest/ucd/auxiliary/GraphemeBreakTest.txt
const WordTuple tests[] = {
#include "GraphemeBreakCases.inc"
};


INSTANTIATE_TEST_SUITE_P( UnicodeTest, WordTest, ValuesIn( tests ) );


TEST( WordTest, MatchesBytes ) {
  Word word( "f????o??a???aR" );

  EXPECT_TRUE( word.ContainsBytes( Word( "f????o??a???ar" ) ) );
  EXPECT_TRUE( word.ContainsBytes( Word( "F????o??a???aR" ) ) );
  EXPECT_TRUE( word.ContainsBytes( Word( "fo??ar"    ) ) );
  EXPECT_TRUE( word.ContainsBytes( Word( "R?????of"    ) ) );
  EXPECT_TRUE( word.ContainsBytes( Word( "??fr???????"    ) ) );
  EXPECT_TRUE( word.ContainsBytes( Word( "f??r"      ) ) );
  EXPECT_TRUE( word.ContainsBytes( Word( "r"        ) ) );
  EXPECT_TRUE( word.ContainsBytes( Word( "??????"      ) ) );
  EXPECT_TRUE( word.ContainsBytes( Word( ""         ) ) );
}


TEST( WordTest, DoesntMatchBytes ) {
  Word word( "Fo?????????r" );

  EXPECT_FALSE( word.ContainsBytes( Word( "Fo?????????r??" ) ) );
  EXPECT_FALSE( word.ContainsBytes( Word( "gggg"    ) ) );
  EXPECT_FALSE( word.ContainsBytes( Word( "??"       ) ) );
  EXPECT_FALSE( word.ContainsBytes( Word( "nfoo?????r" ) ) );
  EXPECT_FALSE( word.ContainsBytes( Word( "F??rmmm"  ) ) );
}

} // namespace YouCompleteMe
