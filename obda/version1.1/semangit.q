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

SELECT ?author (COUNT (?commit) AS ?commit_count) (COUNT (?review) AS ?review_count)
WHERE
{
  ?commit a :commit .
  ?commit :commit_author ?author .
  ?author :github_user_country_code "za" .
  ?review :comment_author ?author
}
GROUP BY ?author
ORDER BY DESC(?commit_count)
LIMIT 10
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
PREFIX : <https://w3id.org/def/semangit/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

SELECT *
WHERE
{
  ?org a :User .
  ?org :githubUserCountryCode "za" .
  ?org :githubUserIsOrg true
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
  ?project :github_project_name "react-native" .
  ?project :repository_created_at ?date .
  ?project :github_has_owner ?owner .
  ?owner :github_user_login "facebook" .
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

SELECT DISTINCT ?user (COUNT (?pr) AS ?pr_count)
WHERE
{
  VALUES ?project { repo:27601818 }
  ?user  :github_user_fake false .
  ?pr :pull_request_base_project ?project .
  ?pr :github_pull_request_merged true .
  ?pr :pull_request_user ?user .
}
GROUP BY ?user
ORDER BY DESC(?pr_count)
[QueryItem="author_commit_count"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Number of commits per author

SELECT ?author (COUNT (?commit) AS ?commit_count)
WHERE
{
  ?commit a :Commit .
  ?commit :commitAuthor ?author .
}
GROUP BY ?author
[QueryItem="top_10_contributors"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>


SELECT ?project ?committer (COUNT(?commit) as ?commits)
WHERE {
  ?commit a :Commit .
  ?commit :belongsToRepository ?project .
  ?commit :commitedBy ?committer .
  ?committer  :githubUserFake false .
  FILTER (?project IN (repo:3905191))
  #VALUES ?project { repo:12159636 repo:3905191}
}  
GROUP BY ?project ?committer
ORDER BY DESC(?commits)
LIMIT 10

#<http://visualdataweb.org/semangit/repository/3905191>	<http://visualdataweb.org/semangit/user/10548>	"4021"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/3905191>	<http://visualdataweb.org/semangit/user/417948>	"2599"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/3905191>	<http://visualdataweb.org/semangit/user/30351173>	"2409"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/3905191>	<http://visualdataweb.org/semangit/user/7122>	"1556"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/3905191>	<http://visualdataweb.org/semangit/user/1579646>	"1070"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/3905191>	<http://visualdataweb.org/semangit/user/4597>	"986"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/3905191>	<http://visualdataweb.org/semangit/user/1637088>	"817"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/3905191>	<http://visualdataweb.org/semangit/user/30225>	"680"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/3905191>	<http://visualdataweb.org/semangit/user/8075646>	"425"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/3905191>	<http://visualdataweb.org/semangit/user/350296>	"382"^^xsd:integer

#<http://visualdataweb.org/semangit/repository/12159636>	<http://visualdataweb.org/semangit/user/988>	"3571"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/12159636>	<http://visualdataweb.org/semangit/user/979>	"2873"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/12159636>	<http://visualdataweb.org/semangit/user/4834>	"2245"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/12159636>	<http://visualdataweb.org/semangit/user/56762>	"2033"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/12159636>	<http://visualdataweb.org/semangit/user/176703>	"1833"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/12159636>	<http://visualdataweb.org/semangit/user/168873>	"1811"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/12159636>	<http://visualdataweb.org/semangit/user/2132795>	"1724"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/12159636>	<http://visualdataweb.org/semangit/user/2712156>	"1621"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/12159636>	<http://visualdataweb.org/semangit/user/1357270>	"1420"^^xsd:integer	
#<http://visualdataweb.org/semangit/repository/12159636>	<http://visualdataweb.org/semangit/user/367108>	"1242"^^xsd:integer
[QueryItem="angular_react_commit_count_by_year"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Select commits for angular and react repositories

SELECT ?repo_name ?mon (COUNT(?commit) AS ?commits)
WHERE
{
  ?commit :commit_belongs_to_repository ?project .
  ?project :github_project_name ?repo_name .
  ?commit :commit_created_at ?date .
  FILTER (?project IN (repo:3905191, repo:12159636))
}
GROUP BY ?repo_name (year(?date) AS ?mon)
[QueryItem="angular_react_commits"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>


SELECT ?repo_name (COUNT(?commit) AS ?commits)
WHERE
{
  ?commit :commit_belongs_to_repository ?project .
  ?project :github_project_name ?repo_name .
  FILTER (?project IN (repo:3905191, repo:12159636))
}
GROUP BY ?repo_name
[QueryItem="angular_react_top_10_contributors"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>


SELECT *
WHERE {
  {
    SELECT ?project ?committer (COUNT(?commit) as ?commits)
      WHERE {
        ?commit :commit_belongs_to_repository ?project .
        ?commit :commit_author ?committer .
        ?committer :github_user_fake false .
        FILTER (?project IN (repo:3905191))
      }  
      GROUP BY ?project ?committer
      ORDER BY DESC(?commits)
      LIMIT 10

  }
  UNION
  {
    SELECT ?project ?committer (COUNT(?commit) as ?commits)
      WHERE {
        ?commit :commit_belongs_to_repository ?project .
        ?commit :commit_author ?committer .
        ?committer :github_user_fake false .
        FILTER (?project IN (repo:12159636))
      }  
      GROUP BY ?project ?committer
      ORDER BY DESC(?commits)
      LIMIT 10
  }
}
[QueryItem="angular_top_10_contributor_commits_vs_prs"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

SELECT ?author (COUNT(DISTINCT ?commit) as ?commits) (COUNT(DISTINCT ?pr) AS ?prs)
WHERE {
  BIND (repo:12159636 AS ?repo)
  ?commit :commit_belongs_to_repository ?repo .
  ?commit :commit_author ?author .
  ?pr :pull_request_base_project ?repo .
  ?pr :pull_request_user ?author .
}
GROUP BY ?author
ORDER BY DESC(?commits)
LIMIT 10
[QueryItem="angular_contributor_commits_vs_prs"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

SELECT ?author (COUNT(DISTINCT ?commit) as ?commits) (COUNT(DISTINCT ?pr) AS ?prs)
WHERE {
  BIND (repo:12159636 AS ?repo)
  ?commit :commit_belongs_to_repository ?repo .
  ?commit :commit_author ?author .
  ?pr :pull_request_base_project ?repo .
  ?pr :pull_request_user ?author .
}
GROUP BY ?author