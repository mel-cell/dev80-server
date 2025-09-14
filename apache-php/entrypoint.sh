#!/bin/bash
set -e

# Direktori web root di dalam kontainer
WWW_DIR="/var/www/html"
# Direktori tempat menyimpan file konfigurasi vhost
VHOSTS_DIR="/etc/apache2/sites-available"

echo "--- Fixpermision for ${WWW_DIR} ---"
chown -R $USER:www-data "${WWW_DIR}" || chown -R www-data:www-data "${WWW_DIR}"
chmod -R 775 "${WWW_DIR}"


# Hapus konfigurasi lama yang dibuat otomatis untuk menangani proyek yang dihapus
rm -f ${VHOSTS_DIR}/auto_*.conf

echo "--- Generating Virtual Hosts ---"

# Loop melalui setiap direktori di /var/www/html
for project_path in ${WWW_DIR}/*; do
    if [ -d "${project_path}" ]; then
        project_name=$(basename "${project_path}")
        doc_root="${project_path}"

        # Deteksi otomatis untuk Laravel: jika ada folder 'public', gunakan itu sebagai DocumentRoot
        if [ -d "${project_path}/public" ]; then
            doc_root="${project_path}/public"
            echo "Laravel project detected: ${project_name} -> ${doc_root}"
        else
            echo "Standard project detected: ${project_name} -> ${doc_root}"
        fi

        # Buat file konfigurasi Virtual Host
        conf_file="${VHOSTS_DIR}/auto_${project_name}.conf"

        cat > "${conf_file}" <<EOF
<VirtualHost *:80>
    ServerName ${project_name}.localhost
    DocumentRoot ${doc_root}

    <Directory ${doc_root}>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/${project_name}-error.log
    CustomLog \${APACHE_LOG_DIR}/${project_name}-access.log combined
</VirtualHost>
EOF

        # Aktifkan site yang baru dibuat
        a2ensite "auto_${project_name}.conf" > /dev/null
    fi
done

echo "--- Installing phpMyAdmin ---"
if [ ! -d "${WWW_DIR}/phpmyadmin" ]; then
    cd /tmp
    wget -q https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
    tar -xzf phpMyAdmin-latest-all-languages.tar.gz
    mv phpMyAdmin-*-all-languages "${WWW_DIR}/phpmyadmin"
    rm phpMyAdmin-latest-all-languages.tar.gz
    # Create config.inc.php
    cat > "${WWW_DIR}/phpmyadmin/config.inc.php" <<EOF
<?php
\$cfg['blowfish_secret'] = 'your_secret_key_here';
\$i = 0;
\$i++;
\$cfg['Servers'][\$i]['auth_type'] = 'config';
\$cfg['Servers'][\$i]['host'] = 'mysql';
\$cfg['Servers'][\$i]['user'] = 'root';
\$cfg['Servers'][\$i]['password'] = 'root';
\$cfg['Servers'][\$i]['compress'] = false;
\$cfg['Servers'][\$i]['AllowNoPassword'] = false;
?>
EOF
    chown -R www-data:www-data "${WWW_DIR}/phpmyadmin"
fi

echo "--- Virtual Host generation complete ---"

# Menjalankan perintah asli dari Docker image (memulai Apache)
exec docker-php-entrypoint apache2-foreground
