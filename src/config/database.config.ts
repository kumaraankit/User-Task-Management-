export default () => ({
    type: 'postgres',
    host: process.env.POSTGRES_HOST || process.env.DB_HOST || 'db',
    port: parseInt(process.env.POSTGRES_PORT || process.env.DB_PORT || '5432', 10),
    username: process.env.POSTGRES_USER || process.env.DB_USER || 'user',
    password: process.env.POSTGRES_PASSWORD || process.env.DB_PASS || 'password',
    database: process.env.POSTGRES_DB || process.env.DB_NAME || 'dbname',
});
