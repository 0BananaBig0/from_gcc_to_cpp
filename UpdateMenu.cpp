#include <iostream>
#include <fstream>
#include <string>
#include <unistd.h>
#include <limits.h>

// Function to check if a file exists
bool fileExists( const std::string& filename ) {
   std::ifstream file( filename );
   return file.good();
}

// Function to clear the content of a file if it exists
void clearFile( const std::string& filename ) {
   if( fileExists( filename ) ) {
      std::ofstream file( filename, std::ios::trunc );   // Open in truncate
                                                         // mode
      file.close();
   }
}

// Function to process the FromGccToCPP.md and generate the README.md
void processMarkdownFiles( const std::string& root_path ) {
   // Check if README.md exists. If it does, clear its content. If not, create
   // it.
   std::string readme_file = root_path + "/README.md";
   clearFile( readme_file );
   // Create or open README.md for writing
   std::ofstream readme( readme_file, std::ios::out );

   // Read the FromGccToCPP.md file
   std::ifstream input_file( root_path + "/docs/FromGccToCPP.md" );
   if( !input_file.is_open() ) {
      std::cout << "Fail to open FromGccToCPP.md." << std::endl;
      return;
   }

   std::string line;
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
         std::string markdown_file_name(
            line.data() + file_name_index_beg,
            file_name_index_end - file_name_index_beg + 1 );
         std::ifstream target_markdown( root_path + "/docs/"
                                        + markdown_file_name );
         markdown_file_name.insert( 0, "./docs/" );
         std::string target_line;
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
               std::string_view first_index_chars( target_line.data(),
                                                   // Not include '#';
                                                   special_char_index );
               std::string_view left_chars(
                  target_line.data() + special_char_index,
                  target_line.size() - special_char_index );
               for( size_t i = space_number; i > 0; i-- ) {
                  readme << ' ';
               }
               readme << first_index_chars;
               readme << markdown_file_name;
               readme << left_chars << std::endl;
            }
            target_markdown.close();
         }
      }
   }
   input_file.close();
   readme.close();
}

std::string getExecutablePath() {
   char path[PATH_MAX];
   ssize_t count = readlink( "/proc/self/exe", path, PATH_MAX );
   return ( count != -1 ) ? std::string( path, count ) : std::string();
}

int main() {
   std::string executable_path = getExecutablePath();
   auto last_slash_pos = executable_path.find_last_of( '/' );
   executable_path.resize( last_slash_pos );
   processMarkdownFiles( executable_path );
   return 0;
}
