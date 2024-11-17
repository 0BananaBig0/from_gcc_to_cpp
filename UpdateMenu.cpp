#include <iostream>
#include <fstream>
#include <string>

using namespace std;

// Function to check if a file exists
bool fileExists( const string& filename ) {
   ifstream file( filename );
   return file.good();
}

// Function to clear the content of a file if it exists
void clearFile( const string& filename ) {
   if( fileExists( filename ) ) {
      ofstream file( filename, ios::trunc );   // Open in truncate mode
      file.close();
   }
}

// Function to process the FromGccToCPP.md and generate the README.md
void processMarkdownFiles() {
   // Check if README.md exists. If it does, clear its content. If not, create it.
   string readme_file = "README.md";
   clearFile( readme_file );
   // Create or open README.md for writing
   ofstream readme( readme_file, ios::out );

   // Read the FromGccToCPP.md file
   ifstream input_file( "./docs/FromGccToCPP.md" );
   if( !input_file.is_open() ) {
      std::cout << "Fail to open FromGccToCPP.md." << std::endl;
      return;
   }

   string line;
   bool first_line_processed = false;
   while( getline( input_file, line ) ) {
      if( !first_line_processed ) {
         // Extract the first line from FromGccToCPP.md
         readme << line << std::endl;
         first_line_processed = true;
         continue;
      }
      if( !line.empty() ) {
         // Count the spaces before the '-'
         size_t space_number = 0;
         for( size_t i = 0; i < line.size(); i++ ) {
            if( line[i] != '-' ) {
               space_number++;
            } else {
               break;
            }
         }
         size_t file_name_index_beg, file_name_index_end;
         for( size_t i = 0; i < line.size(); i++ ) {
            if( line[i] == '/' ) {
               file_name_index_beg = i + 1;
            } else if( line[i] == ')' ) {
               file_name_index_end = i - 1;
            } else {
               continue;
            }
         }
         string markdown_file_name(
            line.data() + file_name_index_beg,
            file_name_index_end - file_name_index_beg + 1 );
         markdown_file_name.insert( 0, "./docs/" );
         ifstream target_markdown( markdown_file_name );
         string target_line;
         size_t ignore_first_two_lines = 2;
         if( target_markdown.is_open() ) {
            while( getline( target_markdown, target_line ) ) {
               if( ignore_first_two_lines ) {
                  ignore_first_two_lines--;
                  continue;
               }
               if( target_line.empty() ) {
                  break;
               }
               size_t special_char_index = 0;
               for( size_t i = target_line.size() - 1; i > 0; i-- ) {
                  if( target_line[i] == '#' ) {
                     special_char_index = i;
                     break;
                  }
               }
               string_view first_index_chars(
                  target_line.data(),
                  special_char_index );   // Not include '#';
               string_view left_chars(
                  target_line.data() + special_char_index,
                  target_line.size() - special_char_index );
               for( size_t i = space_number; i > 0; i-- ) {
                  readme << ' ';
               }
               readme << first_index_chars;
               readme << markdown_file_name;
               readme << left_chars << endl;
            }
            target_markdown.close();
         }
      }
   }
   input_file.close();
   readme.close();
}

int main() {
   processMarkdownFiles();
   return 0;
}
