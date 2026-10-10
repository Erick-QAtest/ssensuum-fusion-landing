import { expect, test } from '@playwright/test';

test.describe('SSENSUUM fusion landing', () => {
  test('@landing @regression renders brand, offer and primary sections', async ({ page }) => {
    await page.goto('/');

    await expect(page.getByRole('heading', { level: 1 })).toContainText('Tu masaje');
    await expect(page.getByRole('button', { name: /Reservar primera visita/i })).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Carta de masajes' })).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Barbería' })).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Medicina estética' })).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Membresía Private Club' })).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Dónde estamos' })).toBeVisible();
  });

  test('@landing @regression first-visit CTA enters booking with the featured service', async ({ page }) => {
    await page.goto('/');
    const cta = page.getByRole('button', { name: /Reservar primera visita/i });
    await expect(cta).toBeEnabled();
    await cta.click();
    await expect(page).toHaveURL(/\/reservar\?service=massage-special/);
  });
});
