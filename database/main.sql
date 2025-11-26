CREATE TABLE batch(
  id    bigserial NOT NULL PRIMARY KEY DEFAULT,
  crop0 bigserial REFERENCES crop(id),
  crop1 bigserial REFERENCES crop(id),
  crop2 bigserial REFERENCES crop(id),
  crop3 bigserial REFERENCES crop(id),
  start_time timestamp NOT NULL,
  end_time   timestamp NOT NULL
);

CREATE TABLE crop(
  id    bigserial NOT NULL PRIMARY KEY DEFAULT,
  batch bigserial REFERENCES batch(id)
);

CREATE TABLE crop_snapshot(
  id   bigserial PRIMARY KEY DEFAULT,
  crop bigserial REFERENCES crop(id),

  -- Water Quality
  water_pH     DECIMAL(4, 12),
  water_temp_c DECIMAL(4, 12),
  CHECK (ph_value IS NULL OR (ph_value >= 0 AND ph_value <= 14)),
  CHECK (water_temp_celsius IS NULL OR (water_temp_celsius >= -55 AND water_temp_celsius <= 125)),

  -- Air Quality
  air_temp_c           DECIMAL(4,12),
  air_humidity_percent DECIMAL(4,12),
  CHECK (air_temp_c IS NULL OR (air_temp_celsius >= -40 AND air_temp_celsius <= 85)),
  CHECK (air_humidity_percent IS NULL OR (air_humidity_percent >= 0 AND air_humidity_percent <= 100)),

  -- Water Purity
  tds_ppm  DECIMAL(4, 12),
  ec_us_cm DECIMAL(4, 12),
  CHECK (tds_ppm IS NULL OR tds_ppm >= 0),
  CHECK (ec_us_cm IS NULL OR ec_us_cm >= 0),

  -- Water Level
  distance_mm    INTEGER,
  water_level_mm INTEGER,

  -- Light Control
  light_lux DECIMAL(4, 12),
  CHECK (light_lux IS NULL OR light_lux >= 0),

  -- Dissolved Oxygen
  do_mg_l        DECIMAL(4, 12),
  do_sat_percent DECIMAL(4, 12),
  CHECK (do_mg_l IS NULL OR (do_mg_l >= 0 AND do_mg_l <= 20)),
);

CREATE TABLE system_snapshot(
  id bigserial PRIMARY KEY DEFAULT

  -- Reservoir Level
  distance_mm       INTEGER,
  resevoir_level_mm INTEGER,
);
