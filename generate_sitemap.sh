#!/bin/bash

echo '# Sitemap' > sitemap.md
echo '' >> sitemap.md
find . -name "*.md" -exec sh -c 'echo "- [{}]({})" >> sitemap.md' \;
