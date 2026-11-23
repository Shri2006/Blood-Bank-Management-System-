// Educational C++ starter: simplified red blood cell donor-to-recipient compatibility.
// This is NOT a clinical decision tool. Real transfusion compatibility requires
// professional assessment, antibody screening and laboratory cross-matching.
#include <iostream>
#include <map>
#include <set>
#include <string>
using namespace std;

int main() {
    map<string, set<string>> compatibleRecipients = {
        {"O-", {"O-", "O+", "A-", "A+", "B-", "B+", "AB-", "AB+"}},
        {"O+", {"O+", "A+", "B+", "AB+"}},
        {"A-", {"A-", "A+", "AB-", "AB+"}},
        {"A+", {"A+", "AB+"}},
        {"B-", {"B-", "B+", "AB-", "AB+"}},
        {"B+", {"B+", "AB+"}},
        {"AB-", {"AB-", "AB+"}},
        {"AB+", {"AB+"}}
    };

    string donor, recipient;
    cout << "Enter donor blood group (e.g. O+): ";
    cin >> donor;
    cout << "Enter recipient blood group (e.g. A+): ";
    cin >> recipient;

    if (!compatibleRecipients.count(donor) || !compatibleRecipients[donor].count(recipient)) {
        cout << "No match under this simplified RBC rule.\n";
    } else {
        cout << "Potential match under this simplified RBC rule.\n";
    }
    cout << "Professional verification and laboratory cross-match are mandatory.\n";
    return 0;
}
