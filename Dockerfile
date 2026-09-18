FROM nginx

# Remove nginx's default sample page
RUN rm -rf /usr/share/nginx/html/*

# Copy the portfolio site into nginx's web root
COPY index.html /usr/share/nginx/html/index.html

# Optional: copy any extra assets (images, css, js) if you add them later
# COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 80

# Basic healthcheck so `docker ps` / orchestrators can see the site is up
HEALTHCHECK --interval=30s --timeout=3s CMD wget -q --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
