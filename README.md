# Rails Facebook Groups Application

This is Rails Facebook Groups Demo Application
This application has following features: 
- login with Facebook
- List facebook Groups
- List Facebbok Groups > Posts/Feeds
- Manage keywords
- send notification if new post added matching Keyword

### Installation

```sh
$ rvm 2.6.4
$ bundle install
$ update database.yml file
$ rake db:create
$ rake db:migrate
$ rails s
```

### Start/Stop delayed job
```sh
$ RAILS_ENV=development bin/delayed_job start
$ RAILS_ENV=development bin/delayed_job stop
```

### Online Demo
[https://stormy-lowlands-95714.herokuapp.com/](https://stormy-lowlands-95714.herokuapp.com/) 


### Testing User
| fb         | login      |
|------------|------------|
| username   | password   |
| 9730919135 | chetan4111 |

### NOTE
- App login password is set using email and appending 123 in it
- Example: email : chetan.tete@gmail.com, so password will be chetan.tete@gmail.com123


## This application has APIs as below: 
#### List Keywords
GET /api/v1/keywords HTTP/1.1
Host: stormy-lowlands-95714.herokuapp.com
Authorization: {token}

#### Create Keyword
POST /api/v1/keywords HTTP/1.1
Host: stormy-lowlands-95714.herokuapp.com
Authorization: {token}
Cache-Control: no-cache
Postman-Token: 55560958-1948-a906-6062-34f1dd9fc4aa
Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW
Content-Disposition: form-data; name="keyword[keyword]"
test
Content-Disposition: form-data; name="keyword[group_id]"
1

#### Update Keyword and Delete Keyword 
#### Generate Authorization Token
POST /api/v1/home/generate_token HTTP/1.1
Host: stormy-lowlands-95714.herokuapp.com
Cache-Control: no-cache
Postman-Token: 31d79cf6-4862-a17e-d5c1-81c7cbd1951a
Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW
Content-Disposition: form-data; name="email"
laavibangre@gmail.com
Content-Disposition: form-data; name="password"
laavibangre@gmail.com123

#### List Facebook Groups
GET /api/v1/groups HTTP/1.1
Host: stormy-lowlands-95714.herokuapp.com
Authorization: {token}

#### List Facebook Posts
GET /api/v1/posts HTTP/1.1
Host: stormy-lowlands-95714.herokuapp.com
Authorization: {token}

Thanks!