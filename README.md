## dbt Snowflake Project

### Overview
This project implements a dbt pipeline for transforming and modeling the MovieLens dataset on Snowflake. It covers raw data staging, building fact and dimension tables, marts, and using seeds for static data. The project demonstrates dbt best practices, including incremental and ephemeral materializations, source configuration, and modular SQL development.

### Tech Stack: AWS S3, DBT Core, Snowflake.

### Architecture

<img width="1278" height="794" alt="image" src="https://github.com/user-attachments/assets/650aca45-12c3-4b70-a783-87772f1d02c1" />


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


### CI/CD Integration
- Implemented CI/CD pipelines to automate dbt runs, tests, and documentation generation on every push.
- Ensured that all code changes are linted, tested, and validated before merging to main.
- Automated deployment steps for consistent and reliable analytics workflows.

### SQLFluff Linting
- Integrated [SQLFluff](https://sqlfluff.com/) for SQL linting and style enforcement across all dbt models.
- Enforced consistent SQL formatting, indentation, and best practices.
- Caught and fixed issues such as:
	- Unqualified or inconsistent column references
	- Unused joins
	- Indentation and layout errors
	- Jinja templating mistakes
- Improved code readability and maintainability.


### Recent Changes & How to Run

#### Recent Changes
- Added CI/CD pipeline for automated dbt runs, tests, and docs generation on every push.
- Integrated SQLFluff for SQL linting and style enforcement.
- Fixed issues flagged by SQLFluff (unqualified references, indentation, unused joins, Jinja errors).
- Updated `packages.yml` to resolve dbt_utils version mismatch.
- Improved documentation and error handling in incremental models.

#### How to Run This Project
1. **Clone the repository:**
	```bash
	git clone <your-repo-url>
	cd snowflake_dbt
	```
2. **Install Python dependencies (recommended with [uv](https://github.com/astral-sh/uv)):**
	```bash
	uv pip install -r requirements.txt
	```
	Or, if you prefer pip:
	```bash
	pip install -r requirements.txt
	```
3. **Install dbt packages:**
	```bash
	dbt deps
	```
4. **Configure your Snowflake profile** in `~/.dbt/profiles.yml`.
5. **Run dbt commands:**
	```bash
	dbt run
	dbt test
	dbt seed
	dbt docs generate
	dbt docs serve
	```
6. **Lint your SQL with SQLFluff:**
	```bash
	sqlfluff lint models --dialect snowflake
	sqlfluff fix models --dialect snowflake  # (optional, to auto-fix)
	```
7. **CI/CD:**
	- On every push, the pipeline will automatically run dbt and SQLFluff checks.
	- Review the pipeline status in your repository's CI/CD dashboard.

---

  <img width="1788" height="161" alt="Screenshot 2025-09-18 172136" src="https://github.com/user-attachments/assets/e101169a-a5f8-4ba6-9a03-57b9ea3d6777" />

  <img width="1882" height="951" alt="Screenshot 2025-09-18 210849" src="https://github.com/user-attachments/assets/c94b5ca3-a006-47bd-b31a-6f4b680fc659" />

  <img width="1418" height="550" alt="Screenshot 2025-09-05 161216" src="https://github.com/user-attachments/assets/7ea27f02-9b0c-49ff-80e3-f69c159d849a" />

  <img width="478" height="545" alt="image" src="https://github.com/user-attachments/assets/3894a150-5991-4cfb-9ab9-107fc6fb4ea0" />

  <img width="464" height="591" alt="image" src="https://github.com/user-attachments/assets/41e14f7a-938a-411e-8c35-c5ab0fc3d7b1" />

  <img width="478" height="545" alt="image" src="https://github.com/user-attachments/assets/d0fdeea7-4a3d-4fc0-ac58-0b9e578ff06a" />


### Resources
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
