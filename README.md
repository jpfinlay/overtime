# Overtime App

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models:
- ~~Post -> date:date rationale:text~~
- ~~User -> Devise~~
- ~~AdminUser -> STI~~

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- ~~Administrate admin dashboard~~
- Email summary to managers (AdminUser) for approval
- Needs to be documented if employee *did not* log overtime

## UI:
- ~~Bootstrap -> formatting~~
- Font Awesome Icons

## TODO:
- ~~Fix bug that renders 'new' Post form twice, obscuring error messages~~
- ~~Restrict access to Admin Dashboartds to admin users only~~
- ~~Create shared flash notice partial~~
- ~~Distinguish between different flash notices: red for alerts, green for success and blue for information~~
- Fix flahsh not displaing for creating/updating/deleting posts.
- Add navbar to Admin Dashboard views
- Prevent users viewing other users' posts via the URL
