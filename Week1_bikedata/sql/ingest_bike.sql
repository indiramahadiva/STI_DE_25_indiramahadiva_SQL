CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.brands as (
        SELECT
            *
        FROM
            read_csv_auto ('data/brands.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.categories as (
        SELECT
            *
        FROM
            read_csv_auto ('data/categories.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.customers as (
        SELECT
            *
        FROM
            read_csv_auto ('data/customers.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.order_items as (
        SELECT
            *
        FROM
            read_csv_auto ('data/order_items.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.orders as (
        SELECT
            *
        FROM
            read_csv_auto ('data/orders.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.products as (
        SELECT
            *
        FROM
            read_csv_auto ('data/products.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.staffs as (
        SELECT
            *
        FROM
            read_csv_auto ('data/staffs.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.stocks as (
        SELECT
            *
        FROM
            read_csv_auto ('data/stocks.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.stores as (
        SELECT
            *
        FROM
            read_csv_auto ('data/stores.csv')
    );