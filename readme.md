# Shorl; Shorten your URL

This is a prototype of url shorten service.

[swagger.yaml](./swagger.yaml) is a draft document for API resources.

## Basic specifications
This implementation is basically for internal API and haven't designed as API that could be published. 

Authentication is not needed in order to shorten or extract url. Authentication required to make list of urls that user have shortened and customize the hash.

URL hash should be unique by combination of original url and user (include non-account user).

Bitly has history of all customized hash, but to simplify the implementation, user can set only one customized hash.

Although this draft does not contains email verification API yet, it should have email verification feature. Email verification won't be mattered for url shorten / extract actions.
