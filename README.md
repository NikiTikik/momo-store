Описание каталогов:
frontend - каталог с кодом фронтенда, докерфайлом и конвеером сборки артефакта.
backend - каталог с кодом бекен, дадокерфайлом и конвеером сборки артефакта.

infra/momo-store-cluster содержит описание кластера Managed Service for Kubernetes для Yandex.Cloud.
infra/momo-store-chart содержит чарт для деплоя в продуктовую среду.

Ссылки:
Nexus (helm-репозиторий) - https://nexus.k8s.praktikum-services.tech/repository/momo-tsarev/ 
SonarQube (frontend) - https://sonarqube.praktikum-services.ru/dashboard?id=momo-frontend-nvi 
SonarQube (backend) - https://sonarqube.praktikum-services.ru/dashboard?id=momo-backend-nvi

Кластер - 
Ссылка на приложение в кластере - 

Чеклист:
- В проекте присутствует .gitlab-ci.yml, в котором описаны шаги сборки
- Артефакты сборки публикуются в систему хранения
- Артефакты сборки версионируются
- Написаны Dockerfile'ы для сборки Docker-образов бэкенда и фронтенда
  - [Бэкенд: бинарный файл Go в Docker-образе](https://gitlab.praktikum-services.ru/std-015-37/momo-store/-/blob/main/backend/Dockerfile)
  - [Фронтенд: HTML-страница раздаётся с Nginx](https://gitlab.praktikum-services.ru/std-015-37/momo-store/-/blob/main/frontend/Dockerfile)
- В GitLab CI описан шаг сборки и публикации артефактов
- В GitLab CI описан шаг тестирования
- В GitLab CI описан шаг деплоя
- Развёрнут Kubernetes-кластер в облаке
- Kubernetes-кластер описан в виде кода, и код хранится в репозитории GitLab
- Конфигурация всех необходимых ресурсов описана согласно IaC
- Состояние Terraform'а хранится в S3
- Секреты не хранятся в открытом виде
- Написаны Kubernetes-манифесты для публикации приложения
- Написан Helm-чарт для публикации приложения
- Helm-чарты публикуются и версионируются в Nexus
