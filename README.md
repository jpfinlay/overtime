# Overtime App

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models:
- x Post -> date:date rationale:text
- x User -> Devise
- AdminUser -> STI

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- Administrate admin dashboard
- Email summary to managers (AdminUser) for approval
- Needs to be documented if employee *did not* log overtime

## UI:
- x Bootstrap -> formatting
- Font Awesome Icons

## TODO:
- Fix bug that renders 'new' Post form twice, obscuring error messages
