#!/bin/bash
set -e

echo "🔍 Validating setup..."
bicep build bicep/main.bicep
helm lint helm