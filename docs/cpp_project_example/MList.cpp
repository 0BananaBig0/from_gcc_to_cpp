////////////////////////////////////////////////////////////////////////////////
///                           File Name: MList.cpp                           ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang633@163.com                         ///
///                         03/05/2025-Wed-16:11:16                          ///
////////////////////////////////////////////////////////////////////////////////

#ifdef LIST
#include <iostream>
#include <vector>
class MList {
      MList* _pre;
      MList* _nex;
      int _data;

   public:
      int get() const { return _data; };

      void set( int data ) { _data = data; };

      void setPre( MList* pre ) { _pre = pre; };

      MList* getPre() const { return _pre; };

      void setNex( MList* nex ) { _nex = nex; };

      MList* getNex() const { return _nex; };

      explicit MList( int data, MList* pre = nullptr, MList* nex = nullptr ):
         _pre( pre ),
         _nex( nex ),
         _data( data ) {
         return;
      }

      explicit MList( const std::vector< int >& vec ) {
         if( vec.size() == 0 ) {
            return;
         }
         _data = vec[0];
         MList* pre = this;
         for( size_t i = 1; i < vec.size(); ++i ) {
            MList* nex = new MList( vec[i], pre );
            pre->setNex( nex );
            pre = nex;
         };
      }

      ~MList() {
         if( _nex != nullptr ) {
            delete _nex;
         }
      }

      void sortAndUnique() {
         MList* cur = this;
         while( cur != nullptr ) {
            MList* sma = cur;
            MList* nex = cur->getNex();
            while( nex != nullptr ) {
               if( nex->get() == cur->get() || nex->get() == sma->get() ) {
                  MList* nex_pre = nex->getPre();
                  MList* nex_nex = nex->getNex();
                  nex->setPre( nullptr );
                  nex->setNex( nullptr );
                  delete nex;
                  nex = nex_nex;
                  if( nex_pre != nullptr ) {
                     nex_pre->setNex( nex );
                  }
                  if( nex != nullptr ) {
                     nex->setPre( nex_pre );
                  }
                  continue;
               }
               if( nex->get() < sma->get() ) {
                  sma = nex;
               }
               nex = nex->getNex();
            }
            if( sma != cur ) {
               int tmp = cur->get();
               cur->set( sma->get() );
               sma->set( tmp );
            }
            cur = cur->getNex();
         }
      }
};

int main() {
   MList my_list( std::vector< int >{ 1, 3, 3, 1, 8, 2 } );
   my_list.sortAndUnique();
   MList* nex = my_list.getNex();
   while( nex != nullptr ) {
      std::cout << nex->get() << '\n';
      nex = nex->getNex();
   }
   return 0;
}
#endif

