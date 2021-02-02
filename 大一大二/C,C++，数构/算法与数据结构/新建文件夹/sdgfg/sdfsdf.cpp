#include <iostream>   
#include <set>   
using namespace std;   
  
struct node{   
    int id, p;   
    bool operator < (const node &b) const{   
        return b.p > p;   
    }   
}t;   
  
int main()   
{   
    //freopen("in.txt", "r", stdin);   
    //freopen("out.txt", "w", stdout);   
       
    int type, id, p;   
    set<node> s;   
    set<node>::iterator it;   
    s.clear();   
    while (cin >> type){   
        if (type == 0) break;   
        if (type == 1){   
            cin >> id >> p;   
            t.id = id; t.p = p;   
            s.insert(t);   
        }   
        else if (type == 2){   
            if (s.empty())    
                cout << "0" << endl;   
            else{   
                it = s.end();   
                it--;   
                cout << ( *(it)).id << endl;   
                s.erase(it);   
            }   
        }   
        else{   
            if (s.empty())    
                cout << "0" << endl;   
            else{   
                it = s.begin();   
                cout << ( *(it)).id << endl;   
                s.erase(it);   
            }   
        }   
    }   
    return 0;   
}  