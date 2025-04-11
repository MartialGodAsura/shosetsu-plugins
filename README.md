# Extensions - Universe

Community extensions for Shosetsu

## Bug Reports

1. Ensure there are no issues for the same bug [here][issues].
2. Click [this link][bug-report] to create a new bug report.
3. Fill out the title with a very brief abstract summary of the issue.
4. Fill out the fields in the description.
5. Submit and wait.

## Source requests

1. Ensure there are no requests for the same site [here][issues].
2. Click [this link][source-request] to create a new source request.
3. Fill out the title with the site name.
4. Fill out the fields in description.
5. Submit and wait.

## Development

A very generic how to:

1. Fork this repository
2. Create a local clone of the repository on your pc
3. Choose what site you want to develop from, either from [issues][issues] or
   of your own choosing
4. Create a new branch on your local repository, following the following naming scheme `impl-thisisaname.domain`
5. Run `./dev-setup` to install documentation from the latest kotlin-lib
6. Start to develop the extension
   - You can use the following templates
     - [Lua Extension][lua-template]
   - Take a look at `./test-server.sh`. It should make testing a lot easier.
7. Ensure the index is updated with the new extension (this is done automatically if you use `./test-server.sh`, otherwise you can run `java -jar bin/extension-tester.jar --generate-index`)
8. Make a PR of that branch into master

### Commit Message style

Please follow the [Conventional Commits][cc] standard.

Here are some sample commit headers:

1. `feat: Add site.url`
2. `feat(extension-file-name): Add new filters`
3. `fix(extension-file-name): Resolve novel parsing bug`
4. `misc(extension-file-name): Update extension icon`
5. `fix(index): Correct extension-file-name data`

### Icon creation

Unique Icons can be created for each extension. 
Following the above steps, but at step 5, develop the icon!

Please ensure the source of the icons are present, so they can be edited later on. 

[lua-template]: https://gitlab.com/shosetsuorg/kotlin-lib/-/raw/main/templates/extension-template.lua
[js-template]:https://gitlab.com/shosetsuorg/kotlin-lib/-/raw/main/templates/extension-template.js
[source-request]: https://gitlab.com/shosetsuorg/extensions/-/issues/new?issuable_template=source_request
[bug-report]: https://gitlab.com/shosetsuorg/extensions/-/issues/new?issuable_template=bug_report
[issues]: https://gitlab.com/shosetsuorg/extensions/-/issues
[cc]: https://www.conventionalcommits.org/en/v1.0.0/