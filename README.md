<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [👴Private Investigator ](#private-investigator-)
  - [🛠 Built With ](#-built-with-)
    - [RoR \& React ](#ror--react-)
    - [Key Features ](#key-features-)
  - [🚀 Live Demo ](#-live-demo-)
  - [Kanban board](#-kanban-)
  - [🔗 Link to the Front-End API app ](#-link-to-the-front-end-api-app-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
  - [✍ Authors ](#-authors-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ ](#-faq-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 👴Private Investigator <a name="about-project"></a>

This repository is the backend and the main repository of our app.

**Private Investigators** is the ultimate solution for booking appointments with professional investigators. Our React app is designed to make the process of finding and booking an investigator as easy and seamless as possible. With a user-friendly interface and intuitive design, Private Investigators is the perfect tool for anyone in need of investigative services. Whether you're looking to uncover the truth about a cheating spouse, investigate a business partner, or simply need help with a personal matter, Private Investigators has got you covered. Try it out today and experience the power of our cutting-edge React app.

## 🛠 Built With <a name="built-with"></a>

### RoR & React <a name="tech-stack"></a>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">/Rails/Rack</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<br>

### Key Features <a name="key-features"></a>

- **API:** The backend provides the api endpoints and interaction logic between parts of the app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>

- There is no live demo for the backend, only the API documentation that you can access at: http://localhost:3001/api-docs/index.html
  Don't forget to run `rails s` first!
  
## Kanban board <a name="kanban"></a>

https://github.com/users/jfoyarzo/projects/2

At the start (The group had 5 members):
![image](https://user-images.githubusercontent.com/103699974/227378558-e66641da-9b6a-48c5-8981-4b241926ceb4.png)

## 🔗 Link to the Front-End part app <a name="link-to-front"></a>

- [Private-Investigators-Front-End](https://github.com/jfoyarzo/final-capstone-frontend)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:
- [Ruby on Rails](https://rubyonrails.org/) installed and running. To get more information, read the [installation guide](https://guides.rubyonrails.org/).

- [PostgreSQL](https://www.postgresql.org/) installed and running

### Setup

Clone this repository to your desired folder:

```
  git clone https://github.com/MattGomb/budget-app-rails.git
  cd Budget-App-rails
```

### Install
Install this project with:

```sh
  bundle install
```

Create Database 
 - Modify config/database.yml line 6 with your postgres password

```
  rails db:create
  rails db:migrate
  rails db:seed
```

**Don't forget to run the seed command to see the prepared investigators, and be able to log in with an 'admin' user. For credentials, please check `seeds.rb`%**

### Usage

To run the project, execute the following command:

```sh
  rails server
  or
  rails s
```

### Run tests

To run tests, run the following command:

```sh
rails db:migrate RAILS_ENV=test

rspec ./spec/models
rspec ./spec/requests
rspec ./spec/routing
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ✍ Authors <a name="authors"></a>

**👨‍💻 Felipe Oyarzo**

- GitHub: [@jfoyarzo](https://github.com/jfoyarzo)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/jorge-felipe-oyarzo-contreras)

**👨‍💻 Mátyás Gombos**

- GitHub: [@MattGomb](https://github.com/MattGomb)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/gombos-matyas/)

**👨‍💻 Waris Haleem**

- GitHub: [@iAmWaris97](https://github.com/iAmWaris97)
- LinkedIn: [Waris Haleem](https://www.linkedin.com/in/waris-haleem/)

**👨‍💻 Chris Clothier**
- LinkedIn: [@chris](https://www.linkedin.com/in/crclothier/)
- Github: [@chris](https://github.com/CRClothier)

**👨‍💻 Emmanuel Orji-Ihuoma**

- GitHub: [@emmiiorji](https://github.com/emmiiorji)
- LinkedIn: [LinkedIn](https://linkedin.com/in/orji-emmanuel)

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project please give it stars on GitHub.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

Special thank to [Murat Korkmaz](https://www.behance.net/muratk) for providing the design guidelines.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ <a name="faq"></a>

- **Is this app free to use?**

  - Yes certainly, it is free to use this app.

<br>

- **Is this app secure?**

  - The app uses various security measures, such as encryption, authentication, and authorization, to protect user data and prevent unauthorized access.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
