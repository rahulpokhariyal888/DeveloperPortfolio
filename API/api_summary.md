# API Interaction Summary

## 1. What is a REST API?

A REST API (Representational State Transfer Application Programming Interface) allows different software applications to communicate over the internet using HTTP methods. It enables clients to request, send, update, and retrieve data from servers in a structured format such as JSON.

## 2. HTTP Status Codes

- **HTTP 200 – OK:** The request was successful, and the server returned the requested data.
- **HTTP 404 – Not Found:** The requested resource or URL could not be found on the server.

## 3. GitHub API

The GitHub REST API was used to retrieve public profile information using the GitHub username `rahulpokhariyal888`.

The response was saved in `API/github_profile.json`.

The following `jq` command extracts selected profile information:

```bash
cat API/github_profile.json | jq '{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}'
```

Explanation of the jq filter:

- `name:.name` – Extracts the user's name.
- `repos:.public_repos` – Extracts the number of public repositories.
- `followers:.followers` – Extracts the follower count.
- `joined:.created_at` – Extracts the account creation date.

## 4. JSONPlaceholder API

The JSONPlaceholder API was used to retrieve sample post data.

The response was saved in `API/sample_posts.json`.

The following command counts the total number of posts:

```bash
cat API/sample_posts.json | jq length
```

The command returned **100**, confirming that the JSON file contains 100 posts.

## 5. Conclusion

This task demonstrated how to retrieve data from REST APIs using curl, store JSON responses in files, and extract useful information using jq.

