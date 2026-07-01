
--we will create a stored procedure to frequently use it--
--loading datasets using bulk loading method--
create or alter procedure bronze.load_bronze as
begin
declare @start_time datetime, @end_time datetime;
begin try
	print 'loading bronze layer';
	print 'loading crm tables';
	print '========================';
	set @start_time= GETDATE();
	TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\dataset_etl\crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time= GETDATE();
		print 'time duration' + cast(datediff(second, @start_time, @end_time)as nvarchar) + 'seconds';
	select count (*) from bronze.crm_cust_info;

	set @start_time= GETDATE();
	TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>> Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\dataset_etl\crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time= GETDATE();
		print 'time duration' + cast(datediff(second, @start_time, @end_time)as nvarchar) + 'seconds';

	select count (*) from bronze.crm_prd_info;

	set @start_time= GETDATE();
	TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>> Inserting Data Into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\dataset_etl\crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time= GETDATE();
		print 'time duration' + cast(datediff(second, @start_time, @end_time )as nvarchar) + 'seconds';

	select count (*) from bronze.crm_sales_details;

	print 'loading erp tables';
	print '=================='
	set @start_time= GETDATE();
	TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\dataset_etl\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time= GETDATE();
		print 'time duration' + cast(datediff(second, @start_time, @end_time)as nvarchar) + 'seconds';

	select count (*) from bronze.erp_loc_a101;
	set @start_time= GETDATE();
	TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\dataset_etl\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time= GETDATE();
		print 'time duration' + cast(datediff(second, @start_time, @end_time)as nvarchar )+ 'seconds';

	select count (*) from bronze.erp_loc_a101;
	set @start_time= GETDATE();
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\dataset_etl\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time= GETDATE();
		print 'time duration' + cast(datediff(second, @start_time, @end_time)as nvarchar) + 'seconds';

	select count (*) from bronze.erp_px_cat_g1v2;
	end try
	begin catch
	 print 'error occured during loading';
	 print 'error :' + error_message();

	end catch
end;
