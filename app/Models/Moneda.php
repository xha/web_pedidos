<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Moneda
 * 
 * @property int $idMoneda
 * @property string $descripcion
 * @property string $simbolo
 * @property bool $principal
 * @property Carbon $fechaCreacion
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|Carrito[] $carritos
 * @property Collection|Compra[] $compras
 * @property Collection|CuentasPorCobrar[] $cuentas_por_cobrars
 * @property Collection|CuentasPorPagar[] $cuentas_por_pagars
 * @property Collection|Inventario[] $inventarios
 * @property Collection|ItemPrecio[] $item_precios
 * @property Collection|Venta[] $venta
 *
 * @package App\Models
 */
class Moneda extends Model
{
	protected $table = 'moneda';
	protected $primaryKey = 'idMoneda';
	public $timestamps = false;

	protected $casts = [
		'principal' => 'bool',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'simbolo',
		'principal',
		'fechaCreacion',
		'estado',
		'activo'
	];

	public function carritos()
	{
		return $this->hasMany(Carrito::class, 'idMoneda');
	}

	public function compras()
	{
		return $this->hasMany(Compra::class, 'idMoneda');
	}

	public function cuentas_por_cobrars()
	{
		return $this->hasMany(CuentasPorCobrar::class, 'idMoneda');
	}

	public function cuentas_por_pagars()
	{
		return $this->hasMany(CuentasPorPagar::class, 'idMoneda');
	}

	public function inventarios()
	{
		return $this->hasMany(Inventario::class, 'idMoneda');
	}

	public function item_precios()
	{
		return $this->hasMany(ItemPrecio::class, 'idMoneda');
	}

	public function venta()
	{
		return $this->hasMany(Venta::class, 'idMoneda');
	}
}
