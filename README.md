# database-backup-actions

![backup mongo database](https://github.com/appleboy/database-backup-action/workflows/backup%20mongo%20database/badge.svg?branch=master)
![backup mysql database](https://github.com/appleboy/database-backup-action/workflows/backup%20mysql%20database/badge.svg?branch=master)
![backup postgres database](https://github.com/appleboy/database-backup-action/workflows/backup%20postgres%20database/badge.svg?branch=master)

[GitHub Action](https://github.com/features/actions) for periodically backup a your database (MySQL,  Postgres or MongoDB) to Local Disk or S3 ([AWS S3](https://aws.amazon.com/free/storage/s3) or [Minio](https://min.io/)).

## Usage

### Postgres

```yaml
    - name: backup postgres
      uses: ./
      with:
        database_driver: postgres
        database_username: db
        database_password: db
        database_name: db
        database_host: postgres:5432

        storage_driver: s3
        access_key_id: 1234567890
        secret_access_key: 1234567890
        storage_endpoint: minio:9000
        storage_bucket: test
        storage_region: ap-northeast-1
        storage_path: backup
```

### MySQL

```yaml
    - name: backup mysql
      uses: ./
      with:
        database_driver: mysql
        database_username: db
        database_password: db
        database_name: db
        database_host: mysql:3306

        storage_driver: s3
        access_key_id: 1234567890
        secret_access_key: 1234567890
        storage_endpoint: minio:9000
        storage_bucket: test
        storage_region: ap-northeast-1
        storage_path: backup
```

### MongoDB

```yaml
    - name: backup mongo
      uses: ./
      with:
        database_driver: mongo
        database_username: db
        database_password: db
        database_name: db
        database_host: mongo:27017
        database_opts: "--authenticationDatabase admin"

        storage_driver: s3
        access_key_id: 1234567890
        secret_access_key: 1234567890
        storage_endpoint: minio:9000
        storage_bucket: test
        storage_region: ap-northeast-1
        storage_path: backup
```

## Input variables

See [action.yml](./action.yml) for more detailed information.

### Database Section

* database_driver - support `postgres`, `mysql` or `mongo`. default is `postgres`
* database_username - database username
* database_password - database password
* database_name - database name
* database_host - database host
* database_opts - see the `pg_dump`, `mysqldump` or `mongodump` command

### Storage Section

* storage_driver - support `s3` or `disk`. default is `s3`
* access_key_id - minio or aws s3 access key id
* secret_access_key - minio or aws s3 secret access key
* storage_endpoint - s3 endpoint. default is `s3.amazonaws.com`
* storage_bucket - s3 bucket name
* storage_region - s3 region. default is `ap-northeast-1`
* storage_path - backup folder path in bucket. default is `backup` and all dump file will save in `bucket/backup` directory
* storage_ssl - default is `false`
* storage_insecure_skip_verify - default is `false`

### Schedule Section

* time_schedule - you may use one of several pre-defined schedules in place of a cron expression.
* time_location - by default, all interpretation and scheduling is done in the machine's local time zone. you can specify a different time zone on construction.
