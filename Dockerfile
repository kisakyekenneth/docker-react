FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build
# The build file generated on the above line is found in "/app/build" in our container

# ---------------- OUR SECOND PHASE --------------
FROM nginx
# The next step helps us to copy build results from the previous stage  called "builder"
# ---- /app/build is the location from the previous stage were we can locate the build static file
# ---- /usr/share/nginx/html :- Is were we shall place our files copied
# Anything placed in the dir "/usr/share/nginx/html" will be served up by nginx when it starts up
COPY --from=builder /app/build /usr/share/nginx/html

# There is no command to start-up nginx b'se it will be started up for us automatically.

# ------------- RUNNING THIS FILE ----------
# 1-> docker build .
# 2-> docker run -p 8080:80 <image_id> 
# where 80:- Is the default port for nginx 