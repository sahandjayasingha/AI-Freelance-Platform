<?php
require_once 'db_connect.php';
$dbStatus = $conn ? "Database Connected" : "Connection Failed";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Freelance Platform</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background-color: #0f172a;
            color: #f8fafc;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 8%;
            background-color: #1e293b;
            border-bottom: 1px solid #334155;
        }
        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: #38bdf8;
        }
        nav a {
            color: #cbd5e1;
            text-decoration: none;
            margin-left: 24px;
            font-weight: 500;
            transition: color 0.2s;
        }
        nav a:hover {
            color: #38bdf8;
        }
        .btn-primary {
            background-color: #38bdf8;
            color: #0f172a;
            padding: 8px 18px;
            border-radius: 6px;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #0284c7;
            color: #ffffff;
        }
        main {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 60px 20px;
        }
        .status-badge {
            background-color: rgba(34, 197, 94, 0.15);
            color: #4ade80;
            border: 1px solid #22c55e;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.85rem;
            margin-bottom: 24px;
        }
        h1 {
            font-size: 2.8rem;
            max-width: 750px;
            margin-bottom: 16px;
            line-height: 1.2;
        }
        p {
            color: #94a3b8;
            max-width: 600px;
            font-size: 1.1rem;
            margin-bottom: 32px;
            line-height: 1.6;
        }
        .actions {
            display: flex;
            gap: 16px;
        }
        .btn-outline {
            border: 1px solid #475569;
            color: #f8fafc;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
        }
        .btn-outline:hover {
            border-color: #38bdf8;
            color: #38bdf8;
        }
        .btn-solid {
            background-color: #38bdf8;
            color: #0f172a;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
        }
        .btn-solid:hover {
            background-color: #0284c7;
            color: #ffffff;
        }
        footer {
            text-align: center;
            padding: 20px;
            background-color: #1e293b;
            color: #64748b;
            font-size: 0.9rem;
            border-top: 1px solid #334155;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">AI Freelance Hub</div>
        <nav>
            <a href="index.php">Home</a>
            <a href="#">Browse Jobs</a>
            <a href="#">Login</a>
            <a href="#" class="btn-primary">Register</a>
        </nav>
    </header>

    <main>
        <div class="status-badge">● System Online | <?php echo $dbStatus; ?></div>
        <h1>Hire Top AI Talent & Build Intelligent Solutions</h1>
        <p>Connect with verified machine learning engineers, data scientists, and AI developers for your next big project.</p>
        <div class="actions">
            <a href="#" class="btn-solid">Post a Project</a>
            <a href="#" class="btn-outline">Find Work</a>
        </div>
    </main>

    <footer>
        &copy; 2026 AI Freelance Platform - Group Project
    </footer>
</body>
</html>