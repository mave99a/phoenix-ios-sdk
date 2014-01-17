/usr/local/bin/appledoc \
--project-name "TSPhoenix" \
--project-company "tigerspike" \
--company-id "com.tigerspike" \
--docset-atom-filename "TSPhoenix.atom" \
--docset-feed-url "http://tigerspike.github.com/TSPhoenix/%DOCSETATOMFILENAME" \
--docset-package-url "http://tigerspike.github.com/TSPhoenix/%DOCSETPACKAGEFILENAME" \
--docset-fallback-url "http://tigerspike.github.com/TSPhoenix/" \
--output "docs" \
--publish-docset \
--logformat xcode \
--keep-intermediate-files \
--no-repeat-first-par \
--no-warn-invalid-crossref \
--ignore "*.m" \
--ignore "LoadableCategory.h" \
--index-desc "README.md" \
"Source/" \
"Models/"