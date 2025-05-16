# 🔧 Business Central - Fix Loopback Authentication Issue

This repository contains a PowerShell script that **disables the Loopback Check** on Windows systems. It is useful in development environments where you configure public URLs for Business Central (e.g., `https://bcclient.domain.com`) **on the same machine**.

## 🚨 The Problem

When Visual Studio or the Web Client tries to authenticate using Windows credentials via a public URL (e.g., `https://bcclient.domain.com`) on the **same machine**:

- Authentication fails or prompts repeatedly
- Access works via `localhost` or the machine's hostname, but triggers certificate warnings
- From a different machine, the same public URL works correctly

### ✅ The Solution

Disable the loopback check by creating or modifying the following registry key:

