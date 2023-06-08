# [InkLink](inklink.herokuapp.com)
![BuiltWithLove](http://ForTheBadge.com/images/badges/built-with-love.svg)
![](https://github.com/margdaly/inklink-be/blob/main/Ink%20Link.png)

### Get ***Linked*** for your next ***Ink!***
**InkLink** is an app helping people find curated artists and local tattoo parlors that fit their tattoo style in their area.
Don't know what style best fits you? Try our *Discover Style* feature to help best match you with the right style and the best artist to get you ***inked***.

Experience InkLink wherever you are! Try us on the web or your mobile device! [inklink.herokuapp.com](inklink.herokuapp.com)

InkLink is the Consultancy group project from Turing School of Software and Design's mod three backend program. Read more: https://backend.turing.edu/module3/projects/consultancy/
- [InkLink BE](https://github.com/margday/inklink-be)
- [InkLink FE](https://github.com/brenicillin/inklink_fe)

# Contributors
---
## Angel Byun [![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/angel-byun) [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/angelbyun)
## Brandon Johnson [![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/brandon-j-94b740b2/) [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/brenicillin)
## Brian Guthrie [![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/brian-guthrie-1bba73232/) [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Brianisthebest)
## Margaret Daly [![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/marg-aret-daly) [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/margdaly)
---
---
# Documentaion
[Ink Link API Documentation](https://inklink-be.herokuapp.com/api-docs/index.html)

## Schema
```
Artist{
name	string
email	string
password	string
password_confirmation	string
styles	[...]
pricing	string
}
```

## Available Endpoints

### ` GET 'api/v0/artists' `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| style, string(query)  | The style of the artist to filter by. Choices ["Watercolor", "American Traditional", "Geometric", "Script", "Black and Gray", "Realism", "Tribal", "Chicano", "Irezumi", "New School"] |

*Example*
```
[
  {
    "name": "string",
    "email": "string",
    "password": "string",
    "password_confirmation": "string",
    "styles": [
      "string"
    ],
    "pricing": "string"
  }
]
```
**Responses**
| Code | Description |
| ----------- | ----------- |
| 200 | A list of artists |

*Example*
```
[
  {
    "name": "string",
    "email": "string",
    "password": "string",
    "password_confirmation": "string",
    "styles": [
      "string"
    ],
    "pricing": "string"
  }
]
```

### ` POST 'api/v0/artist' `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| **artist details**, *required*(body)  | example request body |

*Example*
```
[
  {
    "name": "string",
    "email": "string",
    "password": "string",
    "password_confirmation": "string",
    "styles": [
      "string"
    ],
    "pricing": "string"
  }
]
```
**Responses**
| Code | Description |
| ----------- | ----------- |
| 201 | The artist was created successfully. |

*Example*
```
{
  "name": "string",
  "email": "string",
  "password": "string",
  "password_confirmation": "string",
  "styles": [
    "string"
  ],
  "pricing": "string"
}
```

### ` GET 'api/v0/artist' `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| **id**, *required*string(path)  | The ID of the artist to retrieve. |

**Responses**
| Code | Description |
| ----------- | ----------- |
| 200 | The artist. |

*Example*
```
{
  "name": "string",
  "email": "string",
  "password": "string",
  "password_confirmation": "string",
  "styles": [
    "string"
  ],
  "pricing": "string"
}
```

### ` PATCH 'api/v0/artist' `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| **id**, *required*string(path)  | The ID of the artist to update. |

**Responses**
| Code | Description |
| ----------- | ----------- |
| 200 | The artist was updated successfully. |

*Example*
```
{
  "name": "string",
  "email": "string",
  "password": "string",
  "password_confirmation": "string",
  "styles": [
    "string"
  ],
  "pricing": "string"
}
```

### ` DELETE 'api/v0/artist' `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| **id**, *required*string(path)  | The ID of the artist to delete. |

### ` GET 'api/v0/search' `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| **city**, *required*string  | The city to search for shops. |

**Responses**
| Code | Description |
| ----------- | ----------- |
| 200 | A list of shops. |

### ` GET 'api/v0/discover' `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| **id**, *required*string(path)  | The ID of the artist to delete. |

### ` GET 'api/v0/search' `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| **discover**, *required*string  | The style must be from ["Watercolor", "American Traditional", "Geometric", "Script", "Black and Gray", "Realism", "Tribal", "Chicano", "Irezumi", "New School"]. |

**Responses**
| Code | Description |
| ----------- | ----------- |
| 200 | A list of image urls. |


## Setup
Fork this repository.
Clone your fork.
From the command line, install gems and set up your DB:
```
bundle install
bundle update
rails db:{drop,create,migrate,seed}
```
Run the test suite with `bundle exec rspec`.

## Built With
**Backend**
* ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)  ![Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)  ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

**Frontend**
* ![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black) ![Node.JS](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white) ![HTML](https://img.shields.io/badge/HTML-239120?style=for-the-badge&logo=html5&logoColor=white) ![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white) ![JSON](https://img.shields.io/badge/json%20web%20tokens-323330?style=for-the-badge&logo=json-web-tokens&logoColor=pink)

**Integrations/Deployment**
* ![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?&style=for-the-badge&logo=redis&logoColor=white) ![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white) ![CircleCI](https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white) ![Git](https://img.shields.io/badge/Git-100000?style=for-the-badge&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)

**Planning and Workflow**
* ![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white) ![Canva](https://img.shields.io/badge/Canva-%2300C4CC.svg?&style=for-the-badge&logo=Canva&logoColor=white) ![Zoom](https://img.shields.io/badge/Zoom-2D8CFF?style=for-the-badge&logo=zoom&logoColor=white) ![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white) ![Markdown](https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white) ![Notion](https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white)


<!-- Markdown link & img dfn's -->

[npm-image]: https://img.shields.io/npm/v/datadog-metrics.svg?style=flat-square
[npm-url]: https://npmjs.org/package/datadog-metrics
[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/yourname/yourproject/wiki
