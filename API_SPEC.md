# REST API starter specification

These are the endpoint definitions proposed in the project milestones. They are a contract/design reference, not a claim that a production API server is running.

| Method | Endpoint | Purpose |
|---|---|---|
| POST | `/api/donors/register` | Register donor profile after authenticated user creation |
| GET | `/api/donors` | List/search donor records with access control |
| POST | `/api/inventory/units` | Create a blood-unit record linked to a donation record |
| GET | `/api/inventory` | Filter inventory by group, component and status |
| PATCH | `/api/inventory/units/{unit_id}` | Update unit lifecycle status |
| POST | `/api/requests` | Create recipient blood request |
| GET | `/api/requests` | List authorized recipient requests |
| GET | `/api/matching/suggestions?request_id={id}` | Return preliminary rule-based candidates for professional review |

## Example donor registration request
```json
{
  "name": "Demo Donor",
  "phone": "9000000000",
  "blood_group": "O+",
  "availability": true
}
```

## Example inventory response
```json
{
  "unit_id": 2001,
  "blood_group": "O+",
  "component_type": "Red Blood Cells",
  "status": "Available",
  "expiry_date": "2026-12-18"
}
```

Production requirements: HTTPS, authenticated sessions/tokens, role-based authorization, server-side validation, audit logs, database transactions to prevent double allocation, backups, monitoring, and applicable blood-bank/privacy compliance review.
