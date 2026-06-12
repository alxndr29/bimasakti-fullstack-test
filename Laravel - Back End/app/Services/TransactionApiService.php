<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class TransactionApiService
{
    protected string $baseUrl;

    protected string $secret;

    public function __construct()
    {
        $this->baseUrl = rtrim(config('services.transaction_api.base_url'), '/');
        $this->secret = config('services.transaction_api.secret');
    }

    /**
     * Generate the X-API-Key header value.
     *
     * Formula: SHA256(YYYYMMDD + SECRET)
     */
    protected function generateApiKey(): string
    {
        return hash('sha256', now()->format('Ymd').$this->secret);
    }

    /**
     * Fetch today's transactions from the external API.
     *
     * @return array{success: bool, message: string, code: int, data: mixed}
     */
    public function getTransactionsToday(): array
    {
        return $this->get('/transactions/today');
    }

    /**
     * Fetch the list of providers from the external API.
     *
     * @return array{success: bool, message: string, code: int, data: mixed}
     */
    public function getProviders(): array
    {
        return $this->get('/providers');
    }

    /**
     * Perform a GET request to the external API with the required X-API-Key header.
     *
     * @return array{success: bool, message: string, code: int, data: mixed}
     */
    protected function get(string $path): array
    {
        try {
            $response = Http::withHeaders([
                'X-API-Key' => $this->generateApiKey(),
            ])
                ->timeout(15)
                ->get($this->baseUrl.$path);

            if ($response->successful()) {
                return [
                    'success' => true,
                    'message' => 'Success',
                    'code' => $response->status(),
                    'data' => $response->json(),
                ];
            }

            return [
                'success' => false,
                'message' => $this->mapErrorMessage($response->status()),
                'code' => $response->status(),
                'data' => null,
            ];
        } catch (\Throwable $e) {
            return [
                'success' => false,
                'message' => 'Gagal sinkronisasi data.',
                'code' => 500,
                'data' => null,
            ];
        }
    }

    /**
     * Map external API HTTP status code to a user-friendly message.
     */
    protected function mapErrorMessage(int $status): string
    {
        return match ($status) {
            401 => 'Gagal sinkronisasi data. API key tidak valid (Unauthorized).',
            403 => 'Gagal sinkronisasi data. Akses ditolak (Forbidden).',
            429 => 'Gagal sinkronisasi data. Terlalu banyak permintaan, silakan coba lagi nanti.',
            500 => 'Gagal sinkronisasi data. Terjadi kesalahan pada server eksternal.',
            default => 'Gagal sinkronisasi data.',
        };
    }
}
