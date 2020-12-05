# database-backup-actions

[GitHub Action](https://github.com/features/actions) for periodically backup a your database (MySQL,  Postgres or MongoDB) to Local Disk or S3 ([AWS S3](https://aws.amazon.com/free/storage/s3) or [Minio](https://min.io/)).

## Usage

Each line of a crontab file represents a job, and looks like this:

```sh
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * <command to execute>
```

A cron expression represents a set of times, using 5 space-separated fields.

Field name   | Mandatory? | Allowed values  | Allowed special characters
----------   | ---------- | --------------  | --------------------------
Minutes      | Yes        | 0-59            | * / , -
Hours        | Yes        | 0-23            | * / , -
Day of month | Yes        | 1-31            | * / , - ?
Month        | Yes        | 1-12 or JAN-DEC | * / , -
Day of week  | Yes        | 0-6 or SUN-SAT  | * / , - ?

You may use one of several pre-defined schedules in place of a cron expression.

```sh
Entry                  | Description                                | Equivalent To
-----                  | -----------                                | -------------
@yearly (or @annually) | Run once a year, midnight, Jan. 1st        | 0 0 1 1 *
@monthly               | Run once a month, midnight, first of month | 0 0 1 * *
@weekly                | Run once a week, midnight between Sat/Sun  | 0 0 * * 0
@daily (or @midnight)  | Run once a day, midnight                   | 0 0 * * *
@hourly                | Run once an hour, beginning of hour        | 0 * * * *
```

## Input variables

See [action.yml](./action.yml) for more detailed information.

### Database Section

* database_driver - support `postgres`, `mysql` or `mongo`. default is `postgres`
* database_username - database username
* database_password - database password
* database_name - database name
* database_host - database host
* database_opts - see the `pg_dump`, `mylsqdump` or `mongodump` command

### Storage Section

* storage_driver - support `s3` or `disk`. default is `s3`
* access_key_id - minio or aws s3 access key id
* secret_access_key - minio or aws s3 secret access key
* storage_endpoint - s3 endpoint. default is `s3.amazonaws.com`
* storage_bucket - s3 bucket name
* storage_region - s3 region. default is `ap-northeast-1`
* storage_path - backup folder path in bucket. default is `backup` and all dump file will save in `bucket/path` directory
* storage_ssl - default is `false`
* storage_insecure_skip_verify - default is `false`

### Schedule Section

* time_schedule - you may use one of several pre-defined schedules in place of a cron expression.
* time_location - by default, all interpretation and scheduling is done in the machine's local time zone. you can specify a different time zone on construction.
