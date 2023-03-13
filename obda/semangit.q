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

#Github commits belonging to python repository

SELECT *
WHERE
{
  ?commit a :commit .
  ?project a :repository .
  ?commit :commit_belongs_to_repository ?project .
  ?commit :commit_author ?author .
  ?project :github_project_name "cpython" .
}
[QueryItem="za_organizations"]
PREFIX : <http://visualdataweb.org/semangit/>
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
PREFIX repo: <http://visualdataweb.org/semangit/Repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Select Vue js repository forks

SELECT ?project_fork ?login ?url
WHERE
{
  VALUES ?project { repo:27601818 }
  ?project_fork :githubForkedFrom ?project .
  ?project_fork :githubHasOwner ?owner .
  ?project_fork :repositoryUrl ?url .
  ?owner :githubUserLogin ?login .
}
[QueryItem="vue_core_team_members"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/Repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Select Vue js core team members

SELECT DISTINCT ?user (COUNT (?pr) AS ?pr_count)
WHERE
{
  VALUES ?project { repo:27601818 }
  ?user :githubUserFake false .
  ?pr :pullRequestBaseProject ?project .
  ?pr :githubPullRequestMerged true .
  ?pr :pullRequestUser ?user .
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
  ?author a :User .
  ?author :hasAuthoredCommit ?commit .
}
GROUP BY ?author
[QueryItem="top_10_contributors"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/Repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>


#Top 10 contributors for REACT repository

SELECT ?committer (COUNT(?commit) as ?commits)
WHERE {
  ?committer a :User .
  ?committer :hasCommittedCommit ?commit .
  ?commit :belongsToRepository ?project .
  ?committer :githubUserFake false .
  FILTER (?project IN (repo:3905191))
}  
GROUP BY ?project ?committer
ORDER BY DESC(?commits)
LIMIT 10
[QueryItem="angular_react_commit_count_by_year"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/Repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

#Select commits for angular and react repositories

SELECT ?repo_name ?year (COUNT(?commit) AS ?commits)
WHERE
{
  ?commit :belongsToRepository ?project .
  ?project :githubProjectName ?repo_name .
  ?commit :commitCreatedAt ?date .
  FILTER (?project IN (repo:3905191, repo:12159636))
}
GROUP BY ?repo_name (year(?date) AS ?year)
[QueryItem="angular_react_commits"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/Repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>


SELECT ?repo_name (COUNT(?commit) AS ?commits)
WHERE
{
  ?commit :belongsToRepository ?project .
  ?project :githubProjectName ?repo_name .
  FILTER (?project IN (repo:3905191, repo:12159636))
}
GROUP BY ?repo_name
[QueryItem="angular_react_top_10_contributors"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/Repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>


SELECT *
WHERE {
  {
    SELECT ?project ?author (COUNT(?commit) as ?commits)
      WHERE {
        ?commit :belongsToRepository ?project .
        ?author :hasAuthoredCommit ?commit .
        ?author :githubUserFake false .
        FILTER (?project IN (repo:3905191))
      }  
      GROUP BY ?project ?author
      ORDER BY DESC(?commits)
      LIMIT 10

  }
  UNION
  {
    SELECT ?project ?author (COUNT(?commit) as ?commits)
      WHERE {
        ?commit :belongsToRepository ?project .
        ?author :hasAuthoredCommit ?commit .
        ?author :githubUserFake false .
        FILTER (?project IN (repo:12159636))
      }  
      GROUP BY ?project ?author
      ORDER BY DESC(?commits)
      LIMIT 10
  }
}
[QueryItem="angular_top_10_contributor_commits_vs_prs"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/Repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

SELECT ?author (COUNT(DISTINCT ?commit) as ?commits) (COUNT(DISTINCT ?pr) AS ?prs)
WHERE {
  BIND (repo:12159636 AS ?repo)
  ?commit :belongsToRepository ?repo .
  ?commit :commitAuthor ?author .
  ?pr :pullRequestBaseProject ?repo .
  ?pr :pullRequestUser ?author .
}
GROUP BY ?author
ORDER BY DESC(?commits)
LIMIT 10
[QueryItem="angular_contributor_commits_vs_prs"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/Repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

SELECT ?author (COUNT(DISTINCT ?commit) as ?commits) (COUNT(DISTINCT ?pr) AS ?prs)
WHERE {
  BIND (repo:12159636 AS ?repo)
  ?repo :repositoryHasCommit ?commit .
  ?author :hasAuthoredCommit ?commit .
  ?pr :pullRequestBaseProject ?repo .
  ?pr :pullRequestUser ?author .
}
GROUP BY ?author
[QueryItem="user_programming_language_stats"]
PREFIX : <http://visualdataweb.org/semangit/>
PREFIX repo: <http://visualdataweb.org/semangit/Repository/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>


#Top 10 contributors for REACT repository

SELECT ?language (COUNT(DISTINCT ?user) as ?user_count)
WHERE {
  ?user :programsInLanguage ?projectLanguage .
  ?projectLanguage :githubProjectLanguageIs ?language .
}  
GROUP BY ?language
ORDER BY DESC(?user_count)
LIMIT 10