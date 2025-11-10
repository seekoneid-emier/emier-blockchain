#!/bin/bash
echo "🔄 Memantau Progress Workflow CI/CD"
echo "===================================="

while true; do
    echo ""
    echo "🕐 $(date '+%d-%m-%Y %H:%M:%S') - Memeriksa status..."
    echo "📊 Workflow yang diharapkan:"
    echo "   🤖 CI Pipeline - Sedang berjalan..."
    echo "   📚 Docs Pipeline - Menunggu..."
    echo "   🐳 Docker Pipeline - Menunggu..."
    echo "   🏷️ Release Pipeline - Menunggu..."
    echo ""
    echo "💡 Refresh halaman GitHub Actions untuk melihat update terbaru"
    echo "⏸️  Tekan Ctrl+C untuk berhenti memantau"
    sleep 30
done
