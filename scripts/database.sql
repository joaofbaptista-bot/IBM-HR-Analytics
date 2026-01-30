/*
===============================================================================
 Project: HR Analytics Platform
 Database: HR_ANALYTICS
 Author: Project Team
 Description:
   This script creates the base database and logical schemas following
   the Medallion Architecture (Bronze, Silver, Gold).
   
   - Bronze: Raw / Staging layer (data as received, no transformations)
   - Silver: Cleansed and normalized data (3NF model)
   - Gold: Analytical views optimized for BI tools (Power BI)

   This structure ensures:
   - Clear separation of responsibilities
   - Data lineage and traceability
   - Scalability and maintainability
===============================================================================
*/

------------------------------------------------------------
-- 1. Create Database
--    Best practice:
--    - Dedicated database for analytics
--    - Explicit GO statements for batch separation
------------------------------------------------------------
CREATE DATABASE HR_IBM_ANALYTICS;
GO


------------------------------------------------------------
-- 2. Switch Context to the New Database
------------------------------------------------------------
USE HR_IBM_ANALYTICS;
GO


------------------------------------------------------------
-- 3. Create Schemas (Logical Layers)
--    Using schemas instead of separate databases allows:
--    - Easier permission management
--    - Clear logical separation
--    - Simpler ETL and version control
------------------------------------------------------------

-- Bronze Layer: Raw data (no business logic)
CREATE SCHEMA bronze;
GO

-- Silver Layer: Cleaned, validated and normalized data (3NF)
CREATE SCHEMA silver;
GO

-- Gold Layer: Analytical views for reporting and BI tools
CREATE SCHEMA gold;
GO


/*
===============================================================================
 Notes:
 - No tables should be created directly in the dbo schema.
 - Power BI must connect ONLY to the Gold schema.
 - All transformations must happen between Bronze -> Silver.
 - Gold layer must contain only views (no physical tables).
===============================================================================
*/
