FROM mono:latest
EXPOSE 8080

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y \ 
    mono-xsp4 \
    mono-complete \
    referenceassemblies-pcl

CMD ["xsp4", "--port", "8080", "--nonstop"]