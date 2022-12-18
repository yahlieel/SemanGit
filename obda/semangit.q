[QueryItem="PR_Query"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Github Pull Requests for cpython repository and za User

SELECT *
WHERE
{
  ?pr a :pull_request .
  ?repo a :repository .
  ?org a :user .
  ?pr :pull_request_head_project ?repo .
  ?repo :github_project_name "cpython" .
  ?org :github_user_country_code "za" .
  ?repo :github_has_owner ?org .
}
[QueryItem="User_Query"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Github commits belonging to rails repository

SELECT *
WHERE
{
  ?commit a :commit .
  ?project a :repository .
  ?commit :commit_belongs_to_repository ?project .
  ?commit :commit_author ?author .
  ?project :github_project_name "cpython" .
}
[QueryItem="za_os_contribution"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Github contributions of users with country code "za"

SELECT *
WHERE
{
  ?commit a :commit .
  ?pr a :pull_request .
  ?project a :repository .
  ?author a :user .
  ?commit :commit_belongs_to_repository ?project .
  ?commit :commit_author ?author .
  ?author :github_user_country_code "za" .
  ?pr :pull_request_has_commit ?commit
}
[QueryItem="za_follows_query"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Github project followers of users with country code "za"

SELECT *
WHERE
{
  ?user a :user .
  ?evnt a :github_follow_event .
  #?evnt :github_follower ?user .
  #?evnt :github_follows ?project .
  ?user :github_user_country_code "za" .
}
[QueryItem="za_organizations"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

SELECT *
WHERE
{
  ?org a :user .
  ?org :github_user_country_code "za" .
  ?org :github_user_is_org true
}
[QueryItem="user_actions"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Github project followers of users with country code "za"

SELECT *
WHERE
{
  ?user a :user .
  ?evnt a :github_follow_event .
  #?evnt :github_follower ?user .
  #?evnt :github_follows ?project .
  ?user :github_user_country_code "za" .
}
[QueryItem="vuejs"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Select Vue js repository and owner

SELECT *
WHERE
{
  ?project :github_project_name "vue" .
  ?project :repository_created_at ?date .
  ?project :github_has_owner ?owner .
  ?owner :github_user_login "vuejs" .
}
[QueryItem="vuejs_forks"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Select Vue js repository forks

SELECT ?project_fork ?fork_name ?login ?url
WHERE
{
  VALUES ?project { repo:27601818 }
  ?project_fork :github_forked_from ?project .
  ?project_fork :github_has_owner ?owner .
  ?project_fork :github_project_name ?fork_name .
  ?project_fork :repository_url ?url .
  ?owner :github_user_login ?login .
}
[QueryItem="vue_core_team_members"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Select Vue js core team members

SELECT DISTINCT ?login
WHERE
{
  VALUES ?project { repo:27601818 }
  ?login  :github_user_fake false .
  ?pr :pull_request_base_project ?project .
  ?pr :github_pull_request_merged true .
  ?pr :pull_request_user ?login .
}
[QueryItem="author_commit_count"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Number of commits per author

SELECT ?author (COUNT (?commit) AS ?commit_count)
WHERE
{
  ?commit a :commit .
  ?commit :commit_author ?author .
}
GROUP BY ?author