Getting Started

1. cd url_api
2. bundle install
3. rails db:create and rails db:migrate
4. After gems bundled and database setup completed successfully type `rails s` in terminal  ***** make sure to run rails server first on port 3000 *****

In new terminal tab
1. cd url_client
2. yarn or npm install
3. yarn start or npm instart
4. run on port 3001 (press y when prompted to run on new port)
***** after rails server is running *****

Testing
rspec test/controllers/api/v1/converts_controller_test.rb

Enjoy!