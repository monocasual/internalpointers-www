#!/bin/bash

# ------------------------------------------------------------------------------
# htaccess-gen.sh
#
# Generate htaccess file. Usage:
#
#		./htaccess-gen.sh [base-path] [output-file]
# ------------------------------------------------------------------------------

BASE=$1
OUTPUT_FILE=$2
REWRITE_BASE=$BASE

if [ "$BASE" == "/" ]; then
	BASE=""
fi

cat << EOF > "$OUTPUT_FILE"
# ------------------------------------------------------------------------------
# Enable rewrite engine with RewriteBase.
# ------------------------------------------------------------------------------
RewriteEngine on
RewriteBase $REWRITE_BASE


# ------------------------------------------------------------------------------
# Expiration handling for assets.
# ------------------------------------------------------------------------------
ExpiresActive On
ExpiresByType image/gif       "access plus 1 month"
ExpiresByType image/jpeg      "access plus 1 month"
ExpiresByType image/jpg       "access plus 1 month"
ExpiresByType image/png       "access plus 1 month"
ExpiresByType image/x-icon    "access plus 1 month"
ExpiresByType text/css        "access plus 1 month"
ExpiresByType text/javascript "access plus 1 month"


# ------------------------------------------------------------------------------
# Add 'cache-control' header
# ------------------------------------------------------------------------------
<FilesMatch "\.(gif|jpe?g|png|ico|css|js)$">
Header set Cache-Control "public"
</FilesMatch>


# ------------------------------------------------------------------------------
# If /api/[anything] go to Phalcon, with parameters.
# ------------------------------------------------------------------------------
RewriteCond %{REQUEST_URI} ^$BASE/api/.* [NC]
RewriteRule ^(.*)/?$ public/\$1 [L]


# ------------------------------------------------------------------------------
# If /[anything-else] go to Phalcon, with parameters. Execpt for "ads.txt" that
# must be displayed as plain text.
# ------------------------------------------------------------------------------
RewriteCond %{REQUEST_URI} ^$BASE/.* [NC]
RewriteCond %{REQUEST_URI} !$BASE/ads.txt [NC]
RewriteRule ^(.*)/?$ public/\$1 [L]
EOF
