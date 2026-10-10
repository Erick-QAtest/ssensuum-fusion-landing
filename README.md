# SSENSUUM — Fusion Landing

Implementación en código de la fusión UX/UI:

- identidad visual del portal original (logo real, nogal, cartas, membresía, ubicación)
- hero de conversión: primera visita + anticipo + garantía
- catálogo dinámico conectado a FastAPI
- CTA hacia `/reservar?service=...`
- `data-testid="catalog"` y `data-testid="service-card"` preservados para Playwright
- layout responsive con corrección del solapamiento mobile
- catálogo seed ampliado con los servicios del portal base

## Instalar sobre tu proyecto actual

```bash
cd ~/Downloads/ssensuum-fusion-landing
chmod +x install.sh rollback.sh
./install.sh ~/Downloads/ssensuum-product
```

Si quieres ver todo el catálogo ampliado y ya tienes una DB local:

```bash
cd ~/Downloads/ssensuum-product
./scripts/reset_dev_db.sh
```

Después:

```bash
./scripts/dev.sh
```

Abre `http://localhost:3000`.

## QA

En otra terminal:

```bash
cd ~/Downloads/ssensuum-qa-framework
npm run test:smoke
```

El diseño conserva los contratos usados por el framework QA.

## Rollback

```bash
cd ~/Downloads/ssensuum-fusion-landing
./rollback.sh ~/Downloads/ssensuum-product
```

## Integrar también al framework QA

```bash
cd ~/Downloads/ssensuum-fusion-landing
./install-qa.sh ~/Downloads/ssensuum-qa-framework
```

Después valida la home:

```bash
cd ~/Downloads/ssensuum-qa-framework
npx playwright test tests/e2e/public/landing-fusion.spec.ts --project=desktop-chromium
npm run test:smoke
```
