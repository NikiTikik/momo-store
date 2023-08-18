Описание каталогов:
- **frontend** - каталог с кодом фронтенда, докерфайлом и конвеером сборки артефакта.
- **backend** - каталог с кодом бекен, дадокерфайлом и конвеером сборки артефакта.
- **infra/momo-store-cluster** содержит описание кластера Managed Service for Kubernetes для Yandex.Cloud.
- **infra/momo-store-chart** содержит чарт для деплоя в продуктовую среду.

Ссылки:
- Nexus (helm-репозиторий) - https://nexus.k8s.praktikum-services.tech/repository/momo-tsarev/ 
- SonarQube (frontend) - https://sonarqube.praktikum-services.ru/dashboard?id=momo-frontend-nvi 
- SonarQube (backend) - https://sonarqube.praktikum-services.ru/dashboard?id=momo-backend-nvi
- Ссылка на приложение в кластере - https://momo-super-store.chickenkiller.com/
- Ссылка на графану - 

Чеклист:
- В проекте присутствует .gitlab-ci.yml, в котором описаны шаги сборки
- Артефакты сборки публикуются в систему хранения
- Артефакты сборки версионируются
- Написаны Dockerfile'ы для сборки Docker-образов бэкенда и фронтенда
  - [Бэкенд: бинарный файл Go в Docker-образе](https://gitlab.praktikum-services.ru/std-015-37/momo-store/-/blob/main/backend/Dockerfile)
  - [Фронтенд: HTML-страница раздаётся с Nginx](https://gitlab.praktikum-services.ru/std-015-37/momo-store/-/blob/main/frontend/Dockerfile)
- В GitLab CI описан шаг сборки и публикации артефактов([бекенд](https://gitlab.praktikum-services.ru/std-015-37/momo-store/-/blob/main/backend/.gitlab-ci.yml), [фронтенд](https://gitlab.praktikum-services.ru/std-015-37/momo-store/-/blob/main/frontend/.gitlab-ci.yml))
- В GitLab CI описан шаг тестирования
- В GitLab CI описан шаг [деплоя](https://gitlab.praktikum-services.ru/std-015-37/momo-store/-/blob/main/infra/momo-store-chart/.gitlab-ci.yml)
- Развёрнут Kubernetes-кластер в облаке
- Kubernetes-кластер описан в виде кода, и код хранится в [репозитории GitLab](https://gitlab.praktikum-services.ru/std-015-37/momo-store/-/tree/main/infra/momo-store-cluster)
- Конфигурация всех необходимых ресурсов описана согласно IaC
- Состояние Terraform'а [хранится в S3](https://gitlab.praktikum-services.ru/std-015-37/momo-store/-/blob/main/infra/momo-store-cluster/versions.tf)
- Секреты не хранятся в открытом виде
- Написаны Kubernetes-манифесты для публикации приложения
- Написан [Helm-чарт](https://gitlab.praktikum-services.ru/std-015-37/momo-store/-/tree/main/infra/momo-store-chart) для публикации приложения
- Helm-чарты публикуются и версионируются в [Nexus](https://nexus.k8s.praktikum-services.tech/repository/momo-tsarev/)
