FROM mono:latest
EXPOSE 8080

WORKDIR /app

COPY WingtipToys /app/WingtipToys
COPY WingtipToys.sln /app/WingtipToys.sln

RUN apt-get update && apt-get install -y \ 
    mono-xsp4 \
    mono-complete \
    referenceassemblies-pcl

RUN msbuild /p:Configuration=Release WingtipToys.sln

CMD ["xsp4", "--port", "8080", "--nonstop", "--root", "/app/WingtipToys"]