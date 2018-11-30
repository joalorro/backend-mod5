# HomeEx Helper

HomeEx Helper is a react-based application that serves to provide a platform through which physical therapists can better manage the home exercise programs of patients. Therapists can sign-up by providing the necessary information and details of their licensure and credentials as a physical therapist. They are then given a unique identifier (which, at the moment, is merely their id in the database) that they can share with their patients that upon patient signup, can be used to create the association between therapist and patients. Once the relationship is established, therapists will be allowed to deploy exercises for their patients by providing descriptions and video links that will serve as guides for their patients. Once logged in, patients can then see the newly deployed exercises and interact with each exercise by raising concerns and "flagging" certain exercises and asking questions in the comments section of each exercise.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before running, be sure to have the following installed and running:
* Ruby version: 2.3.3 (or greater)
* [PostgreSQL](https://www.postgresql.org/) database software 

### Installing

Run the following from your terminal in the root directory of this repo:

```
bundle install
rake db:setup
rake db:migrate
rake db:seed (if you want dummy data to work with)
rails s
```

* Ruby on Rails - The backend framework used
* ActiveModelSerializers & Rack Cors - To drive API functionality
* JWT & bcrypt - To provide auth and password hashing

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* Josue Vicente Alorro

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* Hat tip to all friends and instructors for the inspiration and your guidance throughout the making of this project
