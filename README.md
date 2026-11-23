# Blood Bank Management System — Academic Prototype

## Run the prototype
1. Extract the ZIP file.
2. Open `index.html` in Chrome, Edge or Firefox. No installation or server is needed for this demonstration.
3. Navigate using the left menu. Add donors, inventory units and recipient requests; update availability/status; try Donor Matching Support.
4. Data is stored in the browser's `localStorage`. Use the same browser/profile to see saved demo changes. Clear site data to reset; a fresh browser profile restores the sample records.

## Included source files
- `index.html` — interactive HTML/CSS/JavaScript browser prototype.
- `schema.sql` — MySQL-style relational schema for the five entities in the report.
- `API_SPEC.md` — REST endpoint and sample payload design based on Milestone 2.
- `compatibility.cpp` — C++ starter for simplified red-cell compatibility lookup.

## Prototype scope and limitations
- Uses synthetic sample records and browser storage, not a shared server database.
- SQL schema and REST API are starter designs; no backend service is included in this version.
- Matching is a simplified educational demonstration. It does not validate donor eligibility, component-specific clinical compatibility, antibodies, expiry safety, or laboratory cross-match.
- No real blood collection, testing, storage, dispatch, hospital connection, live location tracking, AI prediction or production deployment is performed.
- Never enter real patient or donor personal/medical information into this demo.

## Suggested next development milestone
Implement a backend API (for example, using the team's selected C++ framework or another approved backend), connect it to MySQL, add authentication and role-based access, then run unit/integration/security tests using synthetic data.
