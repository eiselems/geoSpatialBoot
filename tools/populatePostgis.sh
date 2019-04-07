echo "Usage: /populatePostgis.sh <input-file> <admin_level>"
echo "e.g. ./populatePostgis.sh germany-latest.osm.pbf 8"
osmium tags-filter $1 admin_level=$2 -o toBeImported.osm.pbf --overwrite
osm2pgsql --create --database osm_data --username postgres --host localhost --port 5432 -W --cache 14000 -S default.style toBeImported.osm.pbf