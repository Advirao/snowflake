-- step1: creating the secret objects

create or replace secret my_git_pat_secret
type = password
username = 'Advirao'
password = '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'


show secrets

-- step2: create integration , that is connecting the snowflake to github

create or replace api integration my_git_integration
api_provider = git_https_api
api_allowed_prefixes = ('https://github.com/Advirao/')
allowed_authentication_secrets = (my_git_pat_secret)
enabled = true

show integrations


-- step3:Final step to create the repo ( In Summary , sir ( secret, integration repo))

create or replace git repository my_git_repo
api_integration = my_git_integration
git_credentials = my_git_pat_secret
origin = 'https://github.com/Advirao/snowflake'