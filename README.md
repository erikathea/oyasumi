# Oyasumi - Tiny Tracker

This is a mini time tracker - for exploring Ruby 3 and Rails 7.0.43 and practicing TDD code development.

Basic features:
- List user and their time records
- Clock In/Out
- Follow/Unfollow user

This is not architectured to be used in production - security and scalability needs to be factored in depending on real-life constraints (e.g. business timeline, budget, market demand, manpower, etc.). App-health monitoring tools are recommended to be used.
DB is SQLite3 for demo purposes. Please use PostgreSQL if moving to production. Redis is ready to be utilized.
If additional complexities are to be introduced on the Models and DB layer, please consider using another test suite and add additional test.
