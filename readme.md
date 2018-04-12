# Github API Navigator
user = User.from_username 'test'

### returns an array of Repo instances
user.repos


### returns an array of Organization instances
user.followers[0].organizations

#### returns an array of User instances
user.repos[0].assignees
