/ebsvolume/usr/share/elasticsearch/bin/elasticsearch-plugin install repository-s3


SNAPSHOT DATASTORE CREATION

curl -v -XPUT 'http://chef_user:password@127.0.0.1:9200/_snapshot/s3-ustc-radar-backups?pretty' -H 'Content-Type: application/json' -d'
{
  "type": "s3",
  "settings": {
    "bucket": "ustc-radar-backups",
    "region": "us-gov-west-1"
  }
}'

SNAPSHOT

curl -XPUT 'http://chef_user:password@127.0.0.1:9200/_snapshot/s3-ustc-radar-backups/snapshot_before_destroy?wait_for_completion=false&pretty'

STATUS

curl 'http://chef_user:password@127.0.0.1:9200/_snapshot/s3-ustc-radar-backups/snapshot_before_destroy?pretty'


LIST

curl -XGET 'http://chef_user:password@127.0.0.1:9200/_snapshot/s3-ustc-radar-backups/_all?pretty'



RESTORE

curl -XPOST 'http://chef_user:password@127.0.0.1:9200/_snapshot/s3-ustc-radar-backups/snapshot_before_destroy/_restore?pretty' -H 'Content-Type: application/json' -d'
{
  "indices": ".configure_ui,.radar,security",
  "ignore_unavailable": true
}
'
