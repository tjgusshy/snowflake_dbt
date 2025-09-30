## dbt Snowflake Project

### Overview
This project implements a dbt pipeline for transforming and modeling the MovieLens dataset on Snowflake. It covers raw data staging, building fact and dimension tables, marts, and using seeds for static data. The project demonstrates dbt best practices, including incremental and ephemeral materializations, source configuration, and modular SQL development.

### Project Structure
- `models/staging/`: Stages raw data from Snowflake tables (e.g., `src_movies`, `src_tags`).
- `models/dim/`: Dimension tables for movies, users, and tags.
- `models/fct/`: Fact tables for ratings and genome scores, with incremental logic.
- `models/mart/`: Mart layer for analytics-ready tables (e.g., `mart_movie_releases`).
- `seeds/`: Static CSV data (e.g., movie release dates).
- `dbt_project.yml`: Project configuration, materialization settings.
- `requirments.txt`: Python dependencies for dbt and Snowflake adapter.

### Key Features
- Uses dbt’s incremental and ephemeral materializations for performance and modularity.
- Implements source configuration for maintainable references.
- Leverages Jinja for dynamic SQL and macros.
- Handles schema and model configuration at both project and model level.
- Includes seeds for static reference data.

### How to Use
1. **Install dependencies:**
	```bash
	pip install -r requirments.txt
	```
2. **Set up your Snowflake profile** in `~/.dbt/profiles.yml`.
3. **Activate your virtual environment:**
	- PowerShell: `./env/Scripts/Activate`
	- Git Bash: `source .venv/Scripts/activate`
4. **Run dbt commands:**
	```bash
	dbt run
	dbt test
	dbt seed
	dbt docs generate
	dbt docs serve
	```
5. **Materializations:**
	- Fact tables use `incremental` for efficient updates.
	- Some models use `ephemeral` for CTE-based logic.

### What Was Done
- Extracted and staged raw MovieLens data from Snowflake.
- Built dimension and fact tables with transformations and type casting.
- Created marts for analytics-ready data.
- Used seeds for static reference data.
- Configured incremental and ephemeral models for performance.
- Documented and tested models using dbt’s built-in features.
- Set up source configuration for maintainable and portable SQL.

### Resources
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
