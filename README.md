# Cloudlog Docker Image

This resurrects the [now defunct](https://github.com/magicbug/Cloudlog/commit/46652555073ef0b26ff6c2b46f41db05d340c1d7) offical Cloudlog Docker image and combines it with my modification to allow configuration to be defined at runtime (either via `docker-compose.yml` or `docker run`) and make the container in which this runs disposable.

The images will be tagged with the Cloudlog version and available from: [Dockerhub](https://hub.docker.com/r/georgesoteriou/cloudlog).

## Create new version

Update username/image in build.sh as needed.
Run `build.sh <version_number>`. 
This will push an image with both the tag of the version number and 'latest'

## Donations

Please consider either paying for [magicbug to host your cloudlog](https://github.com/magicbug/Cloudlog#want-cloudlog-hosting) or donating [here](https://github.com/magicbug/Cloudlog#patreons--donors).

## Usage

The following environment variables need to set as they will be used to update the configuration files.

* `LOCATOR`
* `BASE_URL`
* `DATABASE_HOSTNAME`
* `DATABASE_NAME`
* `DATABASE_USERNAME`
* `DATABASE_PASSWORD`

These environment variables are optional:

* `CALLBOOK` (should be `qrz` or `hamqth`)
* `CALLBOOK_USERNAME`
* `CALLBOOK_PASSWORD`
* `DEVELOPER_MODE`
* `DATABASE_IS_MARIADB`

### Example: `docker run`

```
docker run \
  -e BASE_URL="http://log.m9abc.com/" \
  -e CALLBOOK="hamqth" \
  -e CALLBOOK_PASSWORD="supersecret" \
  -e CALLBOOK_USERNAME="m9abc" \
  -e DATABASE_HOSTNAME="localhost" \
  -e DATABASE_IS_MARIADB="yes" \
  -e DATABASE_NAME="m9abc_log" \
  -e DATABASE_PASSWORD="supersecret" \
  -e DATABASE_USERNAME="m9abc" \
  -e DEVELOPER_MODE="no" \
  -e LOCATOR="IO94XX" \
  -v 'path/eqsl_card_images':'/var/www/html/images/':'rw'
  -v 'path/backup':'/var/www/html/backup':'rw'
  -v 'path/uploads':'/var/www/html/uploads':'rw'
  ...
  -name=cloudlog \
  georgesoteriou/cloudlog:latest
```

73, HB9IPN
